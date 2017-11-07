# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Department.destroy_all
Department.create(
    [
        { 
            area: 'Gerencia General',
            nota: 1.3,
            padre: 0,
        },
        { 
            area: 'Gerencia Finanzas',
            nota: 1.3,
            padre: 1,
        },
        { 
            area: 'Gerencia Operaciones',
            nota: 1.3,
            padre: 1,
        },
        { 
            area: 'Gerencia Tecnologia',
            nota: 1.3,
            padre: 1,
        },
        { 
            area: 'Contabilidad',
            nota: 1.3,
            padre: 2,
        },
        { 
            area: 'Analisis',
            nota: 1.3,
            padre: 3,
        },
        { 
            area: 'Consultoria',
            nota: 1.3,
            padre: 3,
        },
        { 
            area: 'Desarrollo',
            nota: 1.3,
            padre: 4,
        },
        { 
            area: 'QA',
            nota: 1.3,
            padre: 4,
        },
    ])

p "Created #{Department.count} department"