package com.keepcoding.nutris.ui.navigation

import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.material.ExperimentalMaterialApi
import androidx.compose.runtime.Composable
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.*
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import com.google.accompanist.pager.ExperimentalPagerApi
import com.keepcoding.nutris.ui.screens.community.CommunityScreen
import com.keepcoding.nutris.ui.screens.dashboard.DashboardDetailScreen
import com.keepcoding.nutris.ui.screens.dashboard.DashboardScreen
import com.keepcoding.nutris.ui.screens.dashboard.DashboardViewModel
import com.keepcoding.nutris.ui.screens.exercise.ExerciseScreen
import com.keepcoding.nutris.ui.screens.login.LoginChooseScreen
import com.keepcoding.nutris.ui.screens.login.LoginEmailScreen
import com.keepcoding.nutris.ui.screens.login.LoginViewModel
import com.keepcoding.nutris.ui.screens.onboarding.OnboardingScreen
import com.keepcoding.nutris.ui.screens.profile.ProfileScreen
import com.keepcoding.nutris.ui.screens.register.*
import com.keepcoding.nutris.ui.screens.splash.SplashScreen

@ExperimentalPagerApi
@ExperimentalMaterialApi
@ExperimentalFoundationApi
@Composable
fun Navigation(navController: NavHostController) {

    NavHost(
        navController = navController, startDestination = Feature.SPLASH.route
    ) {

        composable(Feature.SPLASH.route) {
            SplashScreen {
                navController.navigate(Feature.ONBOARDING.route)
            }
        }

        composable(Feature.ONBOARDING.route) {
            OnboardingScreen {
                navController.navigate(Feature.LOGIN.route)
            }
        }

        loginNav(navController)
        registerNav(navController)
        dashboardNav(navController)
        communityNav(navController)
        profileNav(navController)
        exerciseNav(navController)
    }
}

@ExperimentalMaterialApi
@ExperimentalFoundationApi
private fun NavGraphBuilder.loginNav(navController: NavController) {
    navigation(
        startDestination = NavCommand.ContentType(Feature.LOGIN, "choose").route,
        route = Feature.LOGIN.route
    ) {
        composable(NavCommand.ContentType(Feature.LOGIN, "choose")) {
            LoginChooseScreen(onEmailClick = {
                navController.navigate(
                    NavCommand.ContentType(Feature.LOGIN, "email").route
                )
            }, onSignUpClick = {
                navController.navigate(NavCommand.ContentType(Feature.REGISTER, "01").route)
            })
        }

        composable(NavCommand.ContentType(Feature.LOGIN, "email")) {
            val loginViewModel: LoginViewModel = hiltViewModel()
            LoginEmailScreen(onLoginClick = { token ->
                navController.navigate(Feature.DASHBOARD.route + "/$token")
            }, onSignUpClick = {
                navController.navigate(NavCommand.ContentType(Feature.REGISTER, "01").route)
            }, onLoginError = {
                navController.navigate(NavCommand.ContentType(Feature.LOGIN, "email").route)
            }, loginViewModel
            )
        }
    }
}

@ExperimentalMaterialApi
@ExperimentalFoundationApi
private fun NavGraphBuilder.registerNav(navController: NavController) {
    navigation(
        startDestination = NavCommand.ContentType(Feature.REGISTER, "01").route,
        route = Feature.REGISTER.route
    ) {
        composable(NavCommand.ContentType(Feature.REGISTER, "01")) {
            Register01Screen {
                navController.navigate(NavCommand.ContentType(Feature.REGISTER, "02").route)
            }
        }

        composable(NavCommand.ContentType(Feature.REGISTER, "02")) {
            Register02Screen {
                navController.navigate(NavCommand.ContentType(Feature.REGISTER, "03").route)
            }
        }

        composable(NavCommand.ContentType(Feature.REGISTER, "03")) {
            Register03Screen {
                navController.navigate(NavCommand.ContentType(Feature.REGISTER, "04").route)
            }
        }

        composable(NavCommand.ContentType(Feature.REGISTER, "04")) {
            Register04Screen {
                navController.navigate(NavCommand.ContentType(Feature.REGISTER, "05").route)
            }
        }

        composable(NavCommand.ContentType(Feature.REGISTER, "05")) {
            Register05Screen {
                navController.navigate(NavCommand.ContentType(Feature.REGISTER, "06").route)
            }
        }

        composable(NavCommand.ContentType(Feature.REGISTER, "06")) {
            Register06Screen {
                navController.navigate(NavCommand.ContentType(Feature.REGISTER, "07").route)
            }
        }

        composable(NavCommand.ContentType(Feature.REGISTER, "07")) {
            Register07Screen {
                navController.navigate(NavCommand.ContentType(Feature.REGISTER, "08").route)
            }
        }

        composable(NavCommand.ContentType(Feature.REGISTER, "08")) {
            Register08Screen {
                navController.navigate(NavCommand.ContentType(Feature.REGISTER, "terms").route)
            }
        }

        composable(NavCommand.ContentType(Feature.REGISTER, "terms")) {
            TermsOfServiceScreen {
                navController.navigate(NavCommand.ContentType(Feature.DASHBOARD, "home").route)
            }
        }
    }
}

private fun NavGraphBuilder.dashboardNav(navController: NavController) {
    navigation(
        startDestination = NavCommand.ContentType(Feature.DASHBOARD, "home").route + "/token",
        route = Feature.DASHBOARD.route
    ) {
        composable(
            Feature.DASHBOARD.route + "/{token}",
            arguments = listOf(navArgument("token") { this.type = NavType.StringType })
        ) {
            val token = it.arguments?.getString("token") ?: ""
            val dashboardViewModel: DashboardViewModel = hiltViewModel()
            DashboardScreen(token, onClick = { recipe ->
                navController.navigate(
                    NavCommand.ContentTypeDetail(Feature.DASHBOARD).createRoute(recipe)
                )
            }, dashboardViewModel)
        }

        composable(NavCommand.ContentTypeDetail(Feature.DASHBOARD)) {
            DashboardDetailScreen()
        }
    }
}

private fun NavGraphBuilder.profileNav(navController: NavController) {
    navigation(
        startDestination = NavCommand.ContentType(Feature.PROFILE, "home").route,
        route = Feature.PROFILE.route
    ) {
        composable(NavCommand.ContentType(Feature.PROFILE, "home")) {
            ProfileScreen(

            )
        }

        composable(NavCommand.ContentTypeDetail(Feature.PROFILE)) {

        }
    }
}

private fun NavGraphBuilder.communityNav(navController: NavController) {
    navigation(
        startDestination = NavCommand.ContentType(Feature.COMMUNITY, "home").route,
        route = Feature.COMMUNITY.route
    ) {
        composable(NavCommand.ContentType(Feature.COMMUNITY, "home")) {
            CommunityScreen(

            )
        }

        composable(NavCommand.ContentTypeDetail(Feature.COMMUNITY)) {

        }
    }
}

private fun NavGraphBuilder.exerciseNav(navController: NavController) {
    navigation(
        startDestination = NavCommand.ContentType(Feature.EXERCISE, "home").route,
        route = Feature.EXERCISE.route
    ) {
        composable(NavCommand.ContentType(Feature.EXERCISE, "home")) {
            ExerciseScreen(

            )
        }

        composable(NavCommand.ContentTypeDetail(Feature.EXERCISE)) {

        }
    }
}

private fun NavGraphBuilder.composable(
    navCommand: NavCommand, content: @Composable (NavBackStackEntry) -> Unit
) {
    composable(
        route = navCommand.route, arguments = navCommand.args
    ) {
        content(it)
    }
}