require 'rails_helper'

RSpec.describe Labeling, type: :model do
=begin
we want Labeling to belong to labelable. labelable is an interface). An interface
is similar to a class in that it contains method definitions. The difference
etween an interface and a class is that an interface has no implementation of
the methods which it defines.
=end
  it { should belong_to :labelable }




end
