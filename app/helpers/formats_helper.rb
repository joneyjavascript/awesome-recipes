module FormatsHelper
    def date_br timestamp
        timestamp.strftime("%d/%m/%Y")
    end
end
