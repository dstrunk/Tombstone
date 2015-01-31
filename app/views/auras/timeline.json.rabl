collection Aura.where(status: 2).order(:start_date), object_root: false
attributes :id, :name, :description
node(:start) { |aura| aura.start_date.strftime("%Y\-%m\-%d") }
node(:end)   { |aura| aura.end_date.strftime("%Y\-%m\-%d")   }
