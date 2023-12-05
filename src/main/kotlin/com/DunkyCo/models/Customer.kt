package com.DunkyCo.models

import kotlinx.serialization.Serializable

@Serializable
data class e_User(val uid: String, val username: String, val password: String) // Defining of classes according to database
val userStorage = mutableListOf<e_User>() // In-memory storage

