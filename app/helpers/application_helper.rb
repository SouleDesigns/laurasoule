module ApplicationHelper

=begin
  # NOTE: Overriding the default here breaks the Refinery Admin!
  # change the default link renderer for will_paginate
  def will_paginate(collection_or_options = nil, options = {})
    if collection_or_options.is_a? Hash
      options, collection_or_options = collection_or_options, nil
    end
    unless options[:renderer]
      options = options.merge :renderer => BootstrapPaginationHelper::LinkRenderer
    end
    super *[collection_or_options, options].compact
  end
=end

end
