package com.keepcoding.nutris.domain

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

@Parcelize
data class Login(
    val accessToken: String,
    val refreshToken: String
): Parcelable
