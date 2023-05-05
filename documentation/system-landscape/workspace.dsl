workspace {

   !identifiers hierarchical

    model {
        #Entities
        user = element "User" "" "" ""

        #External resource
        externalSystem = element "External API" "External" "Description" "External"

        Matcore = enterprise "Matcore Software Systems" {
            #Software systems
            TripManagement = group "Trip Management" {
                A = softwareSystem "Service A" "" ""
                B = softwareSystem "Service B" "" ""
            }

            #Relationships 
            externalSystem -> A
            user -> B
        }
    }

    views {
        systemlandscape "SystemLandscape" {
            include *
            title "Present System Landscape"
        }

        styles {
            !include ../styles/styles.dsl     
        }
    }
}
