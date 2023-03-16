package com.keepcoding.nutris.fake

import com.keepcoding.nutris.data.remote.RemoteDataSource
import com.keepcoding.nutris.domain.Login
import com.keepcoding.nutris.domain.Recipe
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow

class FakeRemoteDataSource : RemoteDataSource {
    override suspend fun login(email: String, password: String): Flow<Result<Login>> {
        TODO("Not yet implemented")
    }

    override suspend fun getRecipes(token: String): Flow<List<Recipe>> {
        return flow {
            emit(
                listOf(
                    Recipe(
                        1,
                        1,
                        2,
                        "title",
                        "photo",
                        "desc",
                        "food"
                    )
                )
            )
        }
    }
}