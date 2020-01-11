defmodule Verwatch.RecordsTest do
  use Verwatch.DataCase

  alias Verwatch.Records

  describe "records" do
    alias Verwatch.Records.Record

    @valid_attrs %{datetime: ~N[2010-04-17 14:00:00], info: "some info", name: "some name", version: "some version"}
    @update_attrs %{datetime: ~N[2011-05-18 15:01:01], info: "some updated info", name: "some updated name", version: "some updated version"}
    @invalid_attrs %{datetime: nil, info: nil, name: nil, version: nil}

    def record_fixture(attrs \\ %{}) do
      {:ok, record} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Records.create_record()

      record
    end

    test "list_records/0 returns all records" do
      record = record_fixture()
      assert Records.list_records() == [record]
    end

    test "get_record!/1 returns the record with given id" do
      record = record_fixture()
      assert Records.get_record!(record.id) == record
    end

    test "create_record/1 with valid data creates a record" do
      assert {:ok, %Record{} = record} = Records.create_record(@valid_attrs)
      assert record.datetime == ~N[2010-04-17 14:00:00]
      assert record.info == "some info"
      assert record.name == "some name"
      assert record.version == "some version"
    end

    test "create_record/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Records.create_record(@invalid_attrs)
    end

    test "update_record/2 with valid data updates the record" do
      record = record_fixture()
      assert {:ok, %Record{} = record} = Records.update_record(record, @update_attrs)
      assert record.datetime == ~N[2011-05-18 15:01:01]
      assert record.info == "some updated info"
      assert record.name == "some updated name"
      assert record.version == "some updated version"
    end

    test "update_record/2 with invalid data returns error changeset" do
      record = record_fixture()
      assert {:error, %Ecto.Changeset{}} = Records.update_record(record, @invalid_attrs)
      assert record == Records.get_record!(record.id)
    end

    test "delete_record/1 deletes the record" do
      record = record_fixture()
      assert {:ok, %Record{}} = Records.delete_record(record)
      assert_raise Ecto.NoResultsError, fn -> Records.get_record!(record.id) end
    end

    test "change_record/1 returns a record changeset" do
      record = record_fixture()
      assert %Ecto.Changeset{} = Records.change_record(record)
    end
  end
end
