module Jekyll
  module Filter
    def asset_img_size(input)
      file = input.to_s&.split('/').last&.split('.')&.first
      if file == nil then return nil end
      if file.include? '_'
        file = file.split('_').last
          if file.include? 'x'
            file = file.to_s.split('x')
            file.map! { |i| if i == '' then '100%' else i + 'px' end }
            if file.size < 2 then file.push('100%') end
            return file
          else
            nil
          end
      else
        nil
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::Filter)
