package com.keepcoding.nutris.data

import com.keepcoding.nutris.fake.FakeRemoteDataSource
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.toList
import kotlinx.coroutines.test.runTest
import org.junit.Test

class RepositoryImpTest {

    private val fakeRemoteDataSource = FakeRemoteDataSource()

    @OptIn(ExperimentalCoroutinesApi::class)
    @Test
    fun `WHEN get recipes EXPECT valid data`() = runTest{
        //GIVEN
        val repositoryImpl = RepositoryImpl(fakeRemoteDataSource)

        //WHEN
        val actual = repositoryImpl.getRecipes("token").toList()
        //THEN
        assert(actual[0][0].title == "title")
    }
}