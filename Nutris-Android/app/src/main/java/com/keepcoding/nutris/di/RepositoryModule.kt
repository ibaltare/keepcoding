package com.keepcoding.nutris.di

import com.keepcoding.nutris.data.RepositoryImpl
import com.keepcoding.nutris.data.remote.RemoteDataSource
import com.keepcoding.nutris.data.remote.RemoteDataSourceImpl
import com.keepcoding.nutris.domain.Repository
import dagger.Binds
import dagger.Module
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent

@Module
@InstallIn(SingletonComponent::class)
abstract class RepositoryModule {

    @Binds
    abstract fun bindRepository(repositoryImpl: RepositoryImpl): Repository

    @Binds
    abstract fun bindRemoteDataSource(remoteDataSourceImpl: RemoteDataSourceImpl): RemoteDataSource
}