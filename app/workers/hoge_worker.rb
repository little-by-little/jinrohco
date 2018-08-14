class HogeWorker
  include Sidekiq::Worker

  # HogeWorker.perform_async('hoge')
  # HogeWorker.perform_in(2.seconds, 'hoge')
  def perform(data)
    puts data
  end
end