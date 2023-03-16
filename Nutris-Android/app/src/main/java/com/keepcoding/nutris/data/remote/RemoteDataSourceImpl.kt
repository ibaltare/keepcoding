package com.keepcoding.nutris.data.remote

import com.keepcoding.nutris.domain.Login
import com.keepcoding.nutris.domain.Recipe
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import okhttp3.Credentials
import javax.inject.Inject

class RemoteDataSourceImpl @Inject constructor(private val api: NutrisApi):RemoteDataSource {

    override suspend fun login(email: String, password: String): Flow<Result<Login>> {
        return flow{emit(kotlin.runCatching { api.login(Credentials.basic(email, password))})}
    }

    override suspend fun getRecipes(token: String): Flow<List<Recipe>> {
        return flow { emit(api.getRecipes("Bearer $token")) }
    }

}