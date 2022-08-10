# Initialization / package loading
{
  here::here()
}

# Load review data to extract outcomes and exposures
{
  load("./Datasets/main review data.RData")
  exposures <- unique(tolower(df.review[df.review$role.abbrv=="A",]$exposure))
  outcomes <- unique(tolower(df.review[df.review$role.abbrv=="A",]$outcome))
  linking.phrases <- unique(tolower(df.review[df.review$role.abbrv=="A",]$linking.phrase.abstract))
}

# Generate combinations
{
  hypothesaurus <- expand.grid(exposures,linking.phrases,outcomes)
  colnames(hypothesaurus) <- c("Exposure","Linking phrase","Outcome")
}

# Output
{
  save(hypothesaurus,file="./Datasets/hypothesaurus.RData")
  ##write.csv2(hypotheses,"./Datasets/hypothesaurus.csv")
}

# Random hypothesis generator
{
  test <- hypothesaurus[sample(1:nrow(hypothesaurus),20),]
}
