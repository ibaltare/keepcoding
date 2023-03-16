package com.keepcoding.nutris.ui.navigation

import androidx.annotation.DrawableRes
import androidx.annotation.StringRes
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.navigation.NavType
import androidx.navigation.navArgument
import com.keepcoding.nutris.R

enum class NavItem(
    val navCommand: NavCommand,
    @DrawableRes val icon: Int,
    @StringRes val title: Int
) {
    DASHBOARD(NavCommand.ContentType(Feature.DASHBOARD, "home"), R.drawable.dashboard_icon, R.string.dashboard),
    COMMUNITY(NavCommand.ContentType(Feature.COMMUNITY, "home"), R.drawable.community_icon, R.string.community),
    EXERCISE(NavCommand.ContentType(Feature.EXERCISE, "home"), R.drawable.exercise_icon, R.string.exercise),
    PROFILE(NavCommand.ContentType(Feature.PROFILE, "home"), R.drawable.profile_icon, R.string.profile),

}

sealed class NavCommand(
    internal val feature: Feature,
    internal val subRoute: String,
    private val navArgs: List<NavArg> = emptyList()
) {
    class ContentType(feature: Feature, subRoute: String) : NavCommand(feature, subRoute)

    class ContentTypeDetail(feature: Feature) :
        NavCommand(feature, "detail", listOf(NavArg.ItemId)) {
        fun createRoute(itemId: Int) = "${feature.route}/$subRoute/$itemId"
    }

    val route = run {
        val argValues = navArgs.map { "{${it.key}}" }
        listOf(feature.route)
            .plus(subRoute)
            .plus(argValues)
            .joinToString("/")
    }

    val args = navArgs.map {
        navArgument(it.key) { type = it.navType }
    }

}

enum class NavArg(val key: String, val navType: NavType<*>) {
    ItemId("itemId", NavType.IntType)
}