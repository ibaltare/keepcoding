package com.keepcoding.nutris.domain

data class Recipe(
    val rating: Int,
    val id: Int,
    val duration: Int,
    val title: String,
    val photo: String,
    val desc: String,
    val food: String
)
