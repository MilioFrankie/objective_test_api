defmodule ObjectiveTestApi.ApplicantsTest do
  use ObjectiveTestApi.DataCase

  alias ObjectiveTestApi.Applicants

  describe "applicants" do
    alias ObjectiveTestApi.Applicants.Applicant

    @valid_attrs %{cover_letter: "some cover_letter", email: "some email", name: "some name", website: "some website"}
    @update_attrs %{cover_letter: "some updated cover_letter", email: "some updated email", name: "some updated name", website: "some updated website"}
    @invalid_attrs %{cover_letter: nil, email: nil, name: nil, website: nil}

    def applicant_fixture(attrs \\ %{}) do
      {:ok, applicant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Applicants.create_applicant()

      applicant
    end

    test "list_applicants/0 returns all applicants" do
      applicant = applicant_fixture()
      assert Applicants.list_applicants() == [applicant]
    end

    test "get_applicant!/1 returns the applicant with given id" do
      applicant = applicant_fixture()
      assert Applicants.get_applicant!(applicant.id) == applicant
    end

    test "create_applicant/1 with valid data creates a applicant" do
      assert {:ok, %Applicant{} = applicant} = Applicants.create_applicant(@valid_attrs)
      assert applicant.cover_letter == "some cover_letter"
      assert applicant.email == "some email"
      assert applicant.name == "some name"
      assert applicant.website == "some website"
    end

    test "create_applicant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Applicants.create_applicant(@invalid_attrs)
    end

    test "update_applicant/2 with valid data updates the applicant" do
      applicant = applicant_fixture()
      assert {:ok, %Applicant{} = applicant} = Applicants.update_applicant(applicant, @update_attrs)
      assert applicant.cover_letter == "some updated cover_letter"
      assert applicant.email == "some updated email"
      assert applicant.name == "some updated name"
      assert applicant.website == "some updated website"
    end

    test "update_applicant/2 with invalid data returns error changeset" do
      applicant = applicant_fixture()
      assert {:error, %Ecto.Changeset{}} = Applicants.update_applicant(applicant, @invalid_attrs)
      assert applicant == Applicants.get_applicant!(applicant.id)
    end

    test "delete_applicant/1 deletes the applicant" do
      applicant = applicant_fixture()
      assert {:ok, %Applicant{}} = Applicants.delete_applicant(applicant)
      assert_raise Ecto.NoResultsError, fn -> Applicants.get_applicant!(applicant.id) end
    end

    test "change_applicant/1 returns a applicant changeset" do
      applicant = applicant_fixture()
      assert %Ecto.Changeset{} = Applicants.change_applicant(applicant)
    end
  end
end
