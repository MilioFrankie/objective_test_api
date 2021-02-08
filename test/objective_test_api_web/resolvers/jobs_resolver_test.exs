defmodule ObjectiveTestApiWeb.JobsResolverTest do
  use ObjectiveTestApiWeb.ConnCase

  alias ObjectiveTestApiWeb.AbsintheHelpers
  alias ObjectiveTestApi.Jobs.Job
  alias ObjectiveTestApi.Applicants.Applicant
  alias ObjectiveTestApi.Skills.Skill
  alias ObjectiveTestApi.Repo

  setup do
    {:ok, job} = %Job{} |> Job.changeset(%{name: "some_job"}) |> Repo.insert()

    {:ok, applicant} =
      %Applicant{}
      |> Applicant.changeset(%{
        name: "something",
        email: "something",
        website: "something",
        cover_letter: "something",
        job_id: job.id
      })
      |> Repo.insert()

    {:ok, skill} =
      %Skill{} |> Skill.changeset(%{name: "skill", applicant_id: applicant.id}) |> Repo.insert()

    %{job: job, applicant: applicant, skill: skill}
  end

  describe "all_jobs/3" do
    test "fetches all jobs if valid token is sent in header", %{
      job: job,
      applicant: applicant,
      skill: skill
    } do
      query = """
          { allJobs{
            name
            id
            applicants{
              id
              name
              email
              coverLetter
              website
              jobId
              skills{
                name
                id
              }
            }
          }
        }
      """

      result =
        build_conn()
        |> post("/graphiql", AbsintheHelpers.query_skeleton(query, "allJobs"))
        |> json_response(200)

      assert %{"data" => %{"allJobs" => [found_job]}} = result
      %{"applicants" => [%{"skills" => [found_skill]} = found_applicant]} = found_job
      assert found_job["name"] == job.name
      assert found_applicant["name"] == applicant.name
      assert found_skill["name"] == skill.name
    end
  end
end
