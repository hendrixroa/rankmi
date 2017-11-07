Department.destroy_all
Department.create(
    [
        { 
            area: 'Gerencia General',
            nota: 7.333333333,
            padre: 0,
        },
        { 
            area: 'Gerencia Finanzas',
            nota: 5.5,
            padre: 1,
        },
        { 
            area: 'Gerencia Operaciones',
            nota: 7.15,
            padre: 1,
        },
        { 
            area: 'Gerencia Tecnologia',
            nota: 9.35,
            padre: 1,
        },
        { 
            area: 'Contabilidad',
            nota: 5.5,
            padre: 2,
        },
        { 
            area: 'Analisis',
            nota: 6.6,
            padre: 3,
        },
        { 
            area: 'Consultoria',
            nota: 7.7,
            padre: 3,
        },
        { 
            area: 'Desarrollo',
            nota: 8.8,
            padre: 4,
        },
        { 
            area: 'QA',
            nota: 9.9,
            padre: 4,
        },
    ])

p "Creados #{Department.count} departmentos"