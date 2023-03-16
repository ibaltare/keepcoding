package com.keepcoding.nutris.ui.screens.onboarding

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.google.accompanist.pager.ExperimentalPagerApi
import com.google.accompanist.pager.HorizontalPager
import com.google.accompanist.pager.rememberPagerState
import com.keepcoding.nutris.R
import com.keepcoding.nutris.ui.NutrisScreen
import com.keepcoding.nutris.ui.common.DotsIndicator
import com.keepcoding.nutris.ui.common.ButtonMixedText
import com.keepcoding.nutris.ui.theme.SecondaryColor
import com.keepcoding.nutris.ui.theme.SecondaryColorLight

@OptIn(ExperimentalPagerApi::class)
@Composable
fun OnboardingScreen(onStartedClick: () -> Unit) {
    val pagerState = rememberPagerState()


    LazyColumn {
        item {
            HorizontalPager(count = 3, state = pagerState) { page ->
                when (page) {
                    0 -> OnboardingContent(
                        R.drawable.eating,
                        R.string.eat_healthy,
                        R.string.maintaining_good_health
                    )

                    1 -> OnboardingContent(
                        R.drawable.chef,
                        R.string.healthy_recipes,
                        R.string.thousands_of_healthy_recipes
                    )

                    2 -> OnboardingContent(
                        R.drawable.use_app,
                        R.string.track_your_health,
                        R.string.with_amazing_inbuilt_tools
                    )

                }
            }
        }

        item { Spacer(modifier = Modifier.padding(15.dp)) }

        item {
            DotsIndicator(
                modifier = Modifier,
                totalDots = 3,
                selectedIndex = pagerState.currentPage,
                selectedColor = SecondaryColor,
                unSelectedColor = SecondaryColorLight
            )
        }

        item {
            Spacer(modifier = Modifier.padding(25.dp))
        }

        item {
            ButtonMixedText(
                buttonText = R.string.get_started,
                blackText = R.string.already_have_an_account,
                greenText = R.string.log_in,
                modifier = Modifier,
                onButtonClicked = onStartedClick,
                onTextClicked = onStartedClick
            )
        }

        item {
            Spacer(modifier = Modifier.padding(25.dp))
        }
    }
}


@Preview
@Composable
fun OnboardingScreenPreview() {
    NutrisScreen {
        OnboardingScreen {}
    }
}





