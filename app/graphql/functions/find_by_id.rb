class Functions::FindById < GraphQL::Function
  attr_reader :type

  def initialize(model)
    @model = model
    @type = Types.const_get("Types::#{model.name}Type")
  end

  argument :id, !types.ID

  def call(obj, args, ctx)
    @model.find(args[:id])
  end
end
