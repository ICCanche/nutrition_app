module TimeZoneConverter
    def with_mx_time_zone(time)
      return nil unless time.instance_of? ActiveSupport::TimeWithZone
      time.in_time_zone('Mexico City')
    end
  end