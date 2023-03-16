package com.keepcoding.nutris.data.remote

import com.keepcoding.nutris.domain.Login
import com.keepcoding.nutris.domain.Recipe
import kotlinx.coroutines.flow.Flow

interface RemoteDataSource {

    suspend fun login(email: String, password: String): Flow<Result<Login>>
    suspend fun getRecipes(token: String): Flow<List<Recipe>>
}
