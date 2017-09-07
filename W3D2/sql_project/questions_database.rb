require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Users
  attr_accessor :fname, :lname

  def self.all
    users = QuestionsDatabase.instance.execute("SELECT * FROM users")
    users.map { |datum| Users.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def create
    raise "Already in database" if @id
    QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
      INSERT INTO users(fname, lname)
      VALUES (?, ?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def self.find_by_id(id)
    results = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT * FROM users WHERE id = ?
    SQL
    Users.new(results.first)
  end

  def self.find_by_name(fname, lname)
    results = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT * FROM users WHERE fname = ? AND lname = ?
    SQL
    Users.new(results.first)
  end

  def followed_question
    QuestionFollows.followed_questions_for_user_id(@id)
  end

  def average_karma
    result = QuestionsDatabase.instance.execute(<<-SQL, @id)
    SELECT
      CAST(COUNT(b.id) AS FLOAT) / COUNT(DISTINCT(a.id))
    FROM
      questions a
    LEFT OUTER JOIN
      question_likes b
    ON
      b.question_id = a.id
    WHERE
      a.user_id = ?;
    SQL
    result.first.values.first
  end

  def update
    raise "Object is not in the database" if @id.nil?

    QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
    UPDATE
      users
    SET
      fname = ?,
      lname = ?
    WHERE
      id = ?
    SQL
  end
end

class Questions
  attr_accessor :title, :body, :user_id

  def self.all
    questions = QuestionsDatabase.instance.execute("SELECT * FROM questions")

    questions.map { |datum| Questions.new(datum) }
  end

  def initialize(options)
    @id = options["id"]
    @title = options["title"]
    @body = options["body"]
    @user_id = options["user_id"]
  end

  def update
    raise "id is not in database" unless @id
    QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id, @id)
      UPDATE
        questions
      SET
        title = ?, body = ?, user_id = ?
      WHERE
        id = ?
    SQL
  end

  def self.find_by_id(id)
    results = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL

    Questions.new(results.first)
  end

  def followers
    QuestionFollows.followers_for_question_id(@id)
  end

  def create
    raise "Already in database" if @id
    QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id)
      INSERT INTO questions(title, body, user_id)
      VALUES (?, ?, ?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end


  def self.find_by_author_id(author_id)
    result = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL

    result.map { |datum| Questions.new(datum) }
  end

    def most_followed(n)
      QuestionFollows.most_followed_questions(n)
    end

end

class QuestionFollows
  attr_accessor :user_id, :question_id

  def self.all
    results = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")

    results.map { |datum| QuestionFollows.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def create
    raise "Already in database" if @id
    QuestionsDatabase.instance.execute(<<-SQL, @user_id, @question_id)
      INSERT INTO question_follows(user_id, question_id)
      VALUES (?, ?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def self.find_by_id(id)
    result = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL

    QuestionFollows.new(result.first)
  end

  def self.followers_for_question_id(question_id)
    result = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        a.id,
        fname,
        lname
      FROM
        users a
      JOIN
        question_follows b
      ON
        a.id = b.user_id
      WHERE
        b.question_id = ?
    SQL

    result.map { |datum| Users.new(datum) }
  end

  def self.followed_questions_for_user_id(user_id)
    result = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        a.id,
        title,
        body,
        a.user_id
      FROM
        questions a
      JOIN
        question_follows b
      ON
        a.id = b.question_id
      WHERE
        b.user_id = ?
    SQL

    result.map { |datum| Questions.new(datum) }
  end

  def self.most_followed_questions(n)
    result = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        a.id,
        a.title,
        a.body,
        a.user_id,
        COUNT(b.question_id) AS follower_ct
      FROM
        questions a
      JOIN
        question_follows b
      ON
        a.id = b.question_id
      GROUP BY
        a.title
      ORDER BY
        follower_ct
      DESC
      LIMIT ?
    SQL

    result.map { |datum| Questions.new(datum) }
  end

end


class Replies
  attr_accessor :question_id, :parent_id, :user_id, :body

  def self.all
    result = QuestionsDatabase.instance.execute("SELECT * FROM replies")

    result.map { |datum| Replies.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @user_id = options['user_id']
    @body = options['body']
  end

  def self.find_by_id(id)
    result = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL

    Replies.new(result.first)
  end


end

class QuestionLikes
  attr_accessor :user_id, :question_id

  def self.all
    results = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")

    results.map { |datum| QuestionLikes.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.find_by_id(id)
    result = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL

    QuestionLikes.new(result.first)
  end

  def self.most_liked_questions(n)
    result = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        a.id,
        a.title,
        a.body,
        a.user_id,
        COUNT(b.question_id) AS follower_ct
      FROM
        questions a
      JOIN
        question_likes b
      ON
        a.id = b.question_id
      GROUP BY
        a.title
      ORDER BY
        follower_ct
      DESC
      LIMIT ?
    SQL

    result.map { |datum| Questions.new(datum) }

  end

  def self.num_likes_for_question_id(question_id)
    result = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(*)
      FROM
        question_likes
      WHERE
        question_id = ?
    SQL
    result.first.values.first
  end
end
