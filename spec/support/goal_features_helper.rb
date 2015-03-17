module GoalFeaturesHelper
  def add_goals
    click_on('Create New Goal')
    fill_in('Content', with: "Work Out!")
    choose('Complete')
    choose('Private')
    click_button('Make Goal')

    click_on('Create New Goal')
    fill_in('Content', with: "Find a job!")
    choose('Incomplete')
    choose('Public')
    click_button('Make Goal')

    click_on('Create New Goal')
    fill_in('Content', with: "Call your mom!")
    choose('Complete')
    choose('Public')
    click_button('Make Goal')
  end
end
