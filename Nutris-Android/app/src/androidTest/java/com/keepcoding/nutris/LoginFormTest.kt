package com.keepcoding.nutris

import androidx.compose.ui.test.*
import androidx.compose.ui.test.junit4.createComposeRule
import com.keepcoding.nutris.ui.screens.login.FormField
import org.junit.Rule
import org.junit.Test

class LoginFormTest {

    @get:Rule
    val composeRule = createComposeRule()

    @Test
    fun givenEmptyFieldsCorrectDataSetsEnableLoginButton(){
        //Given
        composeRule.setContent {
            FormField(
                email = "",
                password = "",
                onEmailChange = {},
                onPasswordChange = {},
                onLoginClick = { },
                loginEnabled = false
            )
        }
        Thread.sleep(3000)
        //When
        composeRule.onNodeWithText("Email Address").performTextInput("clau@gmail.com")
        composeRule.onNodeWithText("Password").performTextInput("123456")
        Thread.sleep(3000)
        //Then
        composeRule.onNodeWithText("Login").assertIsNotEnabled()
    }
}