package com.keepcoding.nutris.ui

import androidx.compose.material.ScaffoldState
import androidx.compose.material.rememberScaffoldState
import androidx.compose.runtime.Composable
import androidx.compose.runtime.remember
import androidx.navigation.NavHostController
import androidx.navigation.compose.currentBackStackEntryAsState
import androidx.navigation.compose.rememberNavController
import com.keepcoding.nutris.ui.navigation.NavItem
import com.keepcoding.nutris.ui.navigation.navigatePoppingUpToStartDestination

@Composable
fun rememberNutrisAppState(
    scaffoldState: ScaffoldState = rememberScaffoldState(),
    navController: NavHostController = rememberNavController()
): NutrisAppState = remember(scaffoldState, navController) {
    NutrisAppState(scaffoldState, navController)
}

class NutrisAppState(
    val scaffoldState: ScaffoldState,
    val navController: NavHostController
) {
    companion object {
        val BOTTOM_NAV_OPTIONS = listOf(NavItem.DASHBOARD, NavItem.COMMUNITY, NavItem.EXERCISE, NavItem.PROFILE)
    }

    val currentRoute: String
        @Composable get() = navController.currentBackStackEntryAsState().value?.destination?.route
            ?: ""

    val showUpNavigation: Boolean
        @Composable get() = !NavItem.values().map { it.navCommand.route }.contains(currentRoute)

    val showBottomNavigation: Boolean
        @Composable get() = BOTTOM_NAV_OPTIONS.any { currentRoute.contains(it.navCommand.feature.route) }

    fun onUpClick() {
        navController.popBackStack()
    }

    fun onNavItemClick(navItem: NavItem) {
        navController.navigatePoppingUpToStartDestination(navItem.navCommand.route)
    }

}