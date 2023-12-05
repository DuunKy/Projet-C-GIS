package com.DunkyCo.plugins

import com.DunkyCo.routes.*
import io.ktor.server.application.*
// import io.ktor.server.response.*
import io.ktor.server.routing.*

fun Application.configureRouting() {
    routing {
        customerRouting()
        listOrdersRoute()
        getOrderRoute()
        totalizeOrderRoute()

/*        get("/") {
            call.respondText("Hello World!")
        }*/
    }
}
