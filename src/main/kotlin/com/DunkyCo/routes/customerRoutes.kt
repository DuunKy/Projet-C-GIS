package com.DunkyCo.routes

import com.DunkyCo.models.*
import io.ktor.http.*
import io.ktor.server.application.*
import io.ktor.server.request.*
import io.ktor.server.response.*
import io.ktor.server.routing.*

fun Route.customerRouting() {
    route("/e_user") {
        get("{uid?}") {
            val uid = call.parameters["uid"] ?: return@get call.respondText(
                "Missing uid",
                status = HttpStatusCode.BadRequest
            )
            val e_user =
                userStorage.find { it.uid == uid } ?: return@get call.respondText( // uid has to be a string comparison
                    "No user with uid $uid",
                    status = HttpStatusCode.NotFound
                )
            call.respond(e_user)
        }
        post {
            val e_user = call.receive<e_User>()
            userStorage.add(e_user)
            call.respondText("User stored correctly", status = HttpStatusCode.Created)
        }

        delete("{uid?}") {
            val uid = call.parameters["uid"] ?: return@delete call.respond(HttpStatusCode.BadRequest)
            if (userStorage.removeIf { it.uid == uid }) {
                call.respondText("Customer removed correctly", status = HttpStatusCode.Accepted)
            } else {
                call.respondText("Not Found", status = HttpStatusCode.NotFound)
            }
        }
    }
}