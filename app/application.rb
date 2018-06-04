class Application

    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

      if req.path.match("/items/")
        item = req.path.split("/items/").last
        item_instance = @@items.find{|s| s.name == item}
        if item_instance.nil?
            resp.write "Item not found"
            resp.status = 400
         else
            binding.pry
            resp.write item_instance.price
        end
      else
        resp.write "Route not found"
        resp.status = 404
      end
        resp.finish
    end
end