alias ObjectiveTestApi.Applicants.Applicant
alias ObjectiveTestApi.Jobs.Job
alias ObjectiveTestApi.Skills.Skill
alias ObjectiveTestApi.Repo
require Logger

with {:ok, json_data} <- File.read("#{__DIR__}/data.json"),
{:ok, %{jobs: jobs, applicants: applicants, skills: skills}} <- Poison.decode(json_data, keys: :atoms) do
    Repo.insert_all(Job, jobs, on_conflict: :nothing)
    Repo.insert_all(Applicant, applicants, on_conflict: :nothing)
    Repo.insert_all(Skill, skills, on_conflict: :nothing)
else
    e -> Logger.error("Failed to seed data. error: #{inspect(e)}")
end

