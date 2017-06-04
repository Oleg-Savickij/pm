Comment.destroy_all
Task.destroy_all
Project.destroy_all
User.destroy_all

20.times do |index|
  @user = User.create!(email: Faker::Internet.email,
               password: Faker::Internet.password,
               admin: [true, false].sample,
               first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name)
  p "Created #{@user.email} #{@user.password}, #{@user.admin} projects"
end

@statuses = ['in progress', 'done', 'new']
300.times do |index|
  @project = Project.create!(name: Faker::Name.title,
                  summary: Faker::Lorem.paragraph,
                  start_date: Faker::Time.between(4.months.ago, 1.week.ago),
                  end_date: Faker::Time.between(4.months.ago, 1.week.ago))

  10.times do |index|
    @user = User.order("RANDOM()").first
    @task = @project.tasks.create!(title: Faker::Name.title,
                           description: Faker::Lorem.paragraph,
                           status: @statuses.sample,
                           user_id: @user.id)

    15.times do |index|
      @user = User.order("RANDOM()").first
      @task.comments.create!(body: Faker::Lorem.sentence,
                             user_id: @user.id)
    end
  end
end

p "Created #{Project.count} projects"
p "Created #{Task.count} tasks"
p "Created #{Comment.count} tasks"