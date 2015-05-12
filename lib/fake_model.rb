class FakeModel
  def paginate page
    [FakeModel.new]
  end

  def find id
    FakeModel.new
  end
end