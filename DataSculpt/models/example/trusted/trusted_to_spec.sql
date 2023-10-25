{{
    config(
        materializer = "table",
        alias = "spec.grupo_fantastico_client_satisfaction",

    )
}}

select * from raw.grupo_fantastico_listing 