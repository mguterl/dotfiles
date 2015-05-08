class Object
  def local_methods
    (methods - Object.methods).sort
  end
end

## Automatic indentation
IRB.conf[:AUTO_INDENT]=true

## Load the readline module.
IRB.conf[:USE_READLINE] = true

## Remove the annoying irb(main):001:0 and replace with >>
IRB.conf[:PROMPT_MODE] = :SIMPLE
