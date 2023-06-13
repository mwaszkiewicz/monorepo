workspace {

   !identifiers hierarchical

    model {
        #Entities
        user = element "User" "" "" ""

        #External resource
        googlePlaces = element "Google Places API" "" "" "External"

        Matcore = enterprise "Matcore Software Systems" {
            #Software systems
            TripManagement = softwareSystem "Trip Management" {
                UI = container "Web App" "" "" "WebApp"
                BFF = container "API Gateway" "" "Fastify" "Service"

                AuthGroup = group "Auth Domain" {
                    Auth = container "Auth" "" "" "Service"
                    AuthDb = container "Auth Database" "main storage for Auth" "PostgreSQL" "Database"

                    Auth -> AuthDb
                }
                PlacesGroup = group "Places Domain" {
                    Places = container "Places" "" "" "Service"
                    PlacesDb = container "Places Database" "main storage for Places" "PostgreSQL" "Database"

                    Places -> PlacesDb
                }
                ReportingGroup = group "Reporting Domain" {
                    Reporting = container "Reporting" "" "" "Service"
                    ReportingDb = container "Reporting Database" "main storage for Reporting" "PostgreSQL" "Database"

                    Reporting -> ReportingDb
                }
                TripGroup = group "Trip Domain" {
                    Trip = container "Trip" "" "" "Service"
                    TripDb = container "Trip Database" "main storage for Trip" "PostgreSQL" "Database"

                    Trip -> TripDb
                }

                #Relationships 
                user -> UI
                UI -> BFF
                BFF -> Auth
                BFF -> Places
                BFF -> Reporting
                BFF -> Trip

                Places -> googlePlaces
            }
        }
    }

    views {
        systemlandscape "System-Landscape" {
            include *
            autoLayout
            title "Present System Landscape"
        }
        systemContext TripManagement "System-Context" {
            include *
            autoLayout
        }
        container TripManagement "System-Containers" {
            include *
            autoLayout
        }

        styles {
            !include ../styles/styles.dsl     
        }
    }
}
