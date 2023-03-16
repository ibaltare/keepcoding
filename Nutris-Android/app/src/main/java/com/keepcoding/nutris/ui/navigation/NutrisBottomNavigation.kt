package com.keepcoding.nutris.ui.navigation

import androidx.compose.foundation.layout.RowScope
import androidx.compose.material.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.Dp
import com.keepcoding.nutris.ui.theme.PrimaryColorDark
import com.keepcoding.nutris.ui.theme.White

@Composable
fun NutrisBottomNavigation(
    modifier: Modifier = Modifier,
    backgroundColor: Color = PrimaryColorDark,
    contentColor: Color = White,
    elevation: Dp = BottomNavigationDefaults.Elevation,
    content: @Composable RowScope.() -> Unit
) {
    BottomNavigation(
        modifier = modifier,
        backgroundColor = backgroundColor,
        contentColor = contentColor,
        elevation = elevation,
        content = content
    )
}