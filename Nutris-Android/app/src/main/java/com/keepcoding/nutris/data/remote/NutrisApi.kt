package com.keepcoding.nutris.data.remote

import com.keepcoding.nutris.domain.Login
import com.keepcoding.nutris.domain.Recipe
import retrofit2.http.GET
import retrofit2.http.Header
import retrofit2.http.Headers
import retrofit2.http.POST

interface NutrisApi {
    @Headers("Nts-ApiKey: YFjOSZLW7c4cCQLDyvX2rdmbkbZTU5sQasjvranUZtM=")
    @POST("v1/users/login")
    suspend fun login(@Header("Authorization") token: String): Login

    @Headers("Nts-ApiKey: YFjOSZLW7c4cCQLDyvX2rdmbkbZTU5sQasjvranUZtM=")
    @GET("v1/diet")
    suspend fun getRecipes(@Header("Authorization") bearer_token: String): List<Recipe>
}
