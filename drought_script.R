library(readr)
library(tidyverse)
library(extrafont)
loadfonts(device = "win")

pdi <- read_csv(here::here("drought.csv"))

pdi %>%  
  group_by(statefips, year) %>%  
  summarize(mean = mean(pdsi)) %>% 
  ggplot(aes(x = year, y = mean)) + 
  geom_line(aes(x = year, y = mean, group = statefips), alpha = .15, color = "darkblue") + 
  stat_smooth(method = "lm", color = "red")+
  labs(title="Palmer Drought Severity Index, 1895-2016",
       y = "PDSI",
       x = "Year", 
       caption = "Learn more about drought on the Tracking Network's website: \n  https://ephtracking.cdc.gov/showDroughtLanding") +
  theme_light(base_size = 12, ) +
  theme(legend.position = "none",
        text = element_text(family = "Times New Roman"),
        plot.caption =element_text(size = 7, family = "Tahoma"), 
        plot.background = element_rect(fill = "lightgrey")
        ) 
