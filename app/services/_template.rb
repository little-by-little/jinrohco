class FooBarService
  include Procedural

  def initialize(id)
    @id = id
  end

  private

  def call
    @id
  end
end