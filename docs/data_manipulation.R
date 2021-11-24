## ----age_gender_df------------------------------------------------------------
age <- seq(50, 100, length.out=10)
gender <- c("M", "M", "F", "M", "F", "F", "M", "M", "F", "M")
age_gender_df <- data.frame(age, gender)
print(age_gender_df)


## ----age_gender_df_names------------------------------------------------------
# Create variable names
names(age_gender_df) <- c("age", "sex")
# colnames(age_gender_df) <- c("ages", "sex")
print(age_gender_df)


## ----add_edu_level------------------------------------------------------------
# Create factor/quantitative variable
edu_level <- c(1,1,1,2,3,3,2,4,1,1)
age_gender_edu_df <- cbind.data.frame(age_gender_df, edu_level)
age_gender_edu_df


## ----add_edu_factor_levels----------------------------------------------------
age_gender_edu_df$edu_level <- factor(age_gender_edu_df$edu_level
	, levels=c(1,2,3)
	, labels=c("No schooling", "Secondary", "College/University")
)
age_gender_edu_df


## ----pipe_example-------------------------------------------------------------
## Print the first few observations
### Base R
head(age_gender_edu_df)

### Using pipe
age_gender_edu_df %>% head()


## ----pipe_edu_level-----------------------------------------------------------
age_gender_edu_df <- (age_gender_df
	%>% mutate(edu_level=edu_level
		, edu_level=factor(edu_level, levels=c(1,2,3)
			, labels=c("No schooling", "Secondary", "College/University")
		)
	)
)
age_gender_edu_df


## ----simple_pipeline----------------------------------------------------------
data_summary <- (age_gender_edu_df
	%>% filter(!is.na(edu_level))
	%>% select(age, sex)
	%>% ggplot(aes(x=sex, y=age)) + stat_summary() #+ theme_bw()
)
print(data_summary)

