defmodule Discuss.Repo.Migrations.AddTopics do
  use Ecto.Migration

  def change do
    # create a new table called "topics"
    create table(:topics) do
      # add a column named "title" with a type of "string"
      add :title, :string
    end
  end
end
