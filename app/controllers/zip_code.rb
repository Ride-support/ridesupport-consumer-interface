class ZipCode
  attr_reader :id, :owner_id, :owner_type, :name, :status, :event_type, :event_start_date, :event_finish_date, :description, :url, :latitude, :longitude

  def initialize(zip)
    cliente = Savon.client(wsdl: "http://3.86.116.119:8010/ev_events?wsdl")
    response = cliente.call(:event_by_id,message: zip)


    if response.success?
      data = response.to_hash[:event_by_id_response]

      if data
        @id=data[:id]
        @owner_id=data[:owner_id]
        @owner_type=data[:owner_type]
        @name=data[:name]
        @status=data[:status]
        @event_type=data[:event_type]
        @event_start_date=data[:event_start_date]
        @event_finish_date=data[:event_finish_date]
        @description=data[:description]
        @url=data[:url]
        @latitude=data[:latitude]
        @longitude=data[:longitude]
      end

    end

  end

end