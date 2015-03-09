# look at the differences between sign and gesture
# add in data from different sources (discussed in paper)
nonDomLoc <- 51
domLoc <-195
nonDomPro <- 28
domPro <- 458
nonDomGest <- 44
domGest <- 56

# make a table with our values
handChoice<- matrix(c(458,28,195,51,56,44),ncol=2,byrow=TRUE)
colnames(handChoice) <- c("Dominant", "Non-dominant")
rownames(handChoice) <- c("Pronouns","Locational Signs","Gesture")
handChoice <- as.table(handChoice)

#now let's make it proportional to account for differnt samples
propHandChoice <- prop.table(handChoice,1)

# chi-squared test
summary(handChoice)
summary(propHandChoice * 100)

# now let's look at each pairwise difference
x <- (propHandChoice * 100)
# loc vs. pro
chisq.test(x[1:2,])
# pro vs. gesture
chisq.test(rbind(x[1,],x[3,]))
# loc vs. gesture
chisq.test(rbind(x[2,],x[3,]))
# all are significant

# now let's plot this
barplot((propHandChoice * 100)[,1], main = "Percentage of dominant hand use",
        xlab = "Task", ylab = "% Dominant Hand", ylim = c(0,100))
where <- barplot((propHandChoice * 100)[,1], main = "Percentage of dominant hand use",
                 xlab = "Task", ylab = "% Dominant Hand", ylim = c(0,100))
text(x = where, y = c(65,65,65), labels=round((x[,1]), digits = 2))
lines(x = c(0,5), y = c(50,50), lty = 3)

# now using gestures from the database

# make a table with our values
handChoice<- matrix(c(458,28,195,51,483, 145),ncol=2,byrow=TRUE)
colnames(handChoice) <- c("Dominant", "Non-dominant")
rownames(handChoice) <- c("Pronouns","Locational Signs","Gesture")
handChoice <- as.table(handChoice)

#now let's make it proportional to account for differnt samples
propHandChoice <- prop.table(handChoice,1)

# chi-squared test
summary(handChoice)
summary(propHandChoice * 100)

# now let's look at each pairwise difference
x <- (propHandChoice * 100)
x <- handChoice
# loc vs. pro
chisq.test(x[1:2,])
sum(x[1:2,])
# pro vs. gesture
chisq.test(rbind(x[1,],x[3,]))
sum(rbind(x[1,],x[3,]))
# loc vs. gesture
chisq.test(rbind(x[2,],x[3,]))
sum(rbind(x[2,],x[3,]))

# all are significant

# now let's plot this
barplot((propHandChoice * 100)[,1], main = "Percentage of dominant hand use",
        xlab = "Task", ylab = "% Dominant Hand", ylim = c(0,100))
where <- barplot((propHandChoice * 100)[,1], main = "Percentage of dominant hand use",
                 xlab = "Task", ylab = "% Dominant Hand", ylim = c(0,100))
text(x = where, y = c(65,65,65), labels=round((x[,1]), digits = 2))
lines(x = c(0,5), y = c(50,50), lty = 3)

# all together
handChoice<- matrix(c(458,28,195,51,483, 145, 56,44),ncol=2,byrow=TRUE)
colnames(handChoice) <- c("Dominant", "Non-dominant")
rownames(handChoice) <- c("Pronouns","Loc. Signs","Signer Gesture", "Hearing Gesture")
handChoice <- as.table(handChoice)
propHandChoice <- prop.table(handChoice,1)
x <- (propHandChoice * 100)
barplot((propHandChoice * 100)[,1], main = "Percentage of dominant hand use",
        xlab = "Task", ylab = "% Dominant Hand", ylim = c(0,100))
where <- barplot((propHandChoice * 100)[,1], main = "Percentage of dominant hand use",
                 xlab = "Task", ylab = "% Dominant Hand", ylim = c(0,100))
text(x = where, y = c(65,65,65,65), labels=round((x[,1]), digits = 2))
lines(x = c(0,5), y = c(50,50), lty = 3)
