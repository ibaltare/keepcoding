package com.keepcoding.nutris.data

import com.keepcoding.nutris.data.remote.RemoteDataSource
import com.keepcoding.nutris.domain.Login
import com.keepcoding.nutris.domain.Recipe
import com.keepcoding.nutris.domain.Repository
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject

class RepositoryImpl @Inject constructor(private val remoteDataSource: RemoteDataSource): Repository {
    override suspend fun login(email: String, password: String): Flow<Result<Login>> {
        return remoteDataSource.login(email, password)
    }
    override suspend fun getRecipes(token: String): Flow<List<Recipe>> {
        return remoteDataSource.getRecipes(token)
    }
}