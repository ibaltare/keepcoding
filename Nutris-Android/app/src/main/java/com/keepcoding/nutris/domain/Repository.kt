package com.keepcoding.nutris.domain

import kotlinx.coroutines.flow.Flow

interface Repository {
    suspend fun login(email:String, password: String):Flow<Result<Login>>
    suspend fun getRecipes(token: String): Flow<List<Recipe>>
}