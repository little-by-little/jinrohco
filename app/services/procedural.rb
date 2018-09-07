module Procedural
  extend ActiveSupport::Concern

  # インスタンス防止の為にnewをprivate化
  included do
    private_class_method :new
  end

  # お決まりのcallメソッドを定義
  # といってもprivateのcallに丸投げするだけなのでテンプレ
  class_methods do
    def call(*args)
      instance = new(*args)
      yield(instance) if block_given? # これいる？
      instance.send(:call)
    end
  end

  private

  def initialize(*args)
    return if args.empty?
    raise(NotImplementedError, 'You must implement #{self.class}##{__method__}')
  end

  def call
    raise(NotImplementedError, 'You must implement #{self.class}##{__method__}')
  end

end