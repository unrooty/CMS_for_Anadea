module PageHelper
  def sanitizer(string)
    sanitize string, tags: %w( style a b blockquote br caption center cite code col hr h1 h2 h3 h4 h5 h6 h7 h8 del ins iframe colgroup dd div dl dt em i img li ol p pre q small span strike strong sub sup table tbody td tfoot th thead tr u ul object embed param video track audio),
                            attributes: %w(class style target name id title cite span width align alt height rameborder scrolling allowfullscreen border cellpadding cellspacing center frame rules size color face abbr axis colspan rowspan width align value valign dir scope type)
  end
end
