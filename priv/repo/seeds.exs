# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ObjectiveTestApi.Repo.insert!(%ObjectiveTestApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias ObjectiveTestApi.Applicants.Applicant
alias ObjectiveTestApi.Jobs.Job
alias ObjectiveTestApi.Skills.Skill
alias ObjectiveTestApi.Repo


{:ok, json_data} = File.read("#{__DIR__}/data.json")
data = ~s(#{json_data}) |> Poison.Parser.parse!(%{keys: :atoms!})
now = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)


applicants = Enum.map(data.applicants, fn applicant -> 
    Map.merge(applicant, %{ inserted_at: now, updated_at: now })
end)

jobs = Enum.map(data.jobs, fn job -> 
    Map.merge(job, %{ inserted_at: now, updated_at: now })
end)

skills = Enum.map(data.skills, fn skill -> 
    Map.merge(skill, %{ inserted_at: now, updated_at: now })
end)

Repo.insert_all(Job, jobs, on_conflict: :nothing)
Repo.insert_all(Applicant, applicants, on_conflict: :nothing)
Repo.insert_all(Skill, skills, on_conflict: :nothing)

