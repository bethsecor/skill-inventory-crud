class SkillInventoryApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :method_override, true
  # set :erb, :layout => :'/layouts/layout'

  get '/' do
    erb :dashboard
  end

  get '/capybara' do
    erb :capybara
  end

  get '/skills' do
    @skills = SkillInventory.all
    erb :index
  end

  get '/skills/new' do
    erb :new
  end

  post '/skills' do
    SkillInventory.create(params[:skill])
    redirect '/skills'
  end

  get '/skills/email' do
    erb :email
  end

  post '/skills/email' do
    @skills = SkillInventory.all
    @name = params[:name]

    Pony.options = ({ :via_options          => {
                      :address              => "smtp.gmail.com",
                      :port                 => 587,
                      :user_name            => 'beth.skill.inventory@gmail.com',
                      :password             => '123capybara',
                      :authentication       => 'plain',
                      :enable_starttls_auto => true
                      },
                      :via                  => :smtp })

    Pony.mail( {:to      => params[:email],
                :from    => 'beth.skill.inventory@gmail.com',
                :subject => "Your Skill List from Skillz",
                :headers => { 'Content-Type' => 'text/html' },
                :body    => erb(:'/mailer/email_skills', layout: :'/mailer/email_wrapper') })

    redirect '/skills'
  end

  get '/skills/:id' do |id|
    @skill = SkillInventory.find(id.to_i)
    erb :show
  end

  get '/skills/:id/edit' do |id|
    @skill = SkillInventory.find(id.to_i)
    erb :edit
  end

  put '/skills/:id' do |id|
    SkillInventory.update(id.to_i, params[:skill])
    redirect "/skills/#{id}"
  end

  delete '/skills/:id' do |id|
    SkillInventory.delete(id.to_i)
    redirect '/skills'
  end

  not_found do
    erb :error
  end
end
