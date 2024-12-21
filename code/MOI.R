# Load necessary library for visualization
library(ggplot2)

# Set parameters
moi_values <- seq(0.5, 5, by = 0.1)  # MOI values from 0.5 to 5 in increments of 0.1
k_max <- 10  # Maximum number of phages to consider

# Create a data frame for all MOI values
data <- do.call(rbind, lapply(moi_values, function(lambda) {
  k_values <- 0:k_max
  probabilities <- dpois(k_values, lambda)
  data.frame(k = k_values, Probability = probabilities, MOI = lambda)
}))

# Load necessary library for visualization
library(ggplot2)

# Set parameters
moi_values <- seq(0.5, 5, by = 0.1)  # MOI values from 0.5 to 5 in increments of 0.1
k_max <- 10  # Maximum number of phages to consider

# Create a data frame for all MOI values
data <- do.call(rbind, lapply(moi_values, function(lambda) {
  k_values <- 0:k_max
  probabilities <- dpois(k_values, lambda)
  data.frame(k = k_values, Probability = probabilities, MOI = lambda)
}))

# Generate a line plot with a three-color gradient palette and custom legend position
plot <- ggplot(data, aes(x = k, y = Probability, group = MOI, color = MOI)) +
  geom_line(size = 1) +
  scale_color_gradientn(
    name = "MOI",
    colors = c("#56B4E9", "#F0E442", "#D55E00"),  # Three-color range
    breaks = seq(0.5, 5, by = 1),  # Reference points for the gradient
    labels = as.character(seq(0.5, 5, by = 1))
  ) +
  labs(
    title = expression(bold("Proportion of bacteria infected by phages")),  # Make title bold
    x = expression("Number of phages (" * italic(k) * ")"),  # Correctly italicize k
    y = "Probability"
  ) +
  theme_minimal() +
  theme(
    panel.grid = element_blank(),
    axis.line = element_line(color = "black", size = 0.8),
    axis.ticks = element_line(color = "black", size = 0.8),
    axis.ticks.length = unit(0.4, "cm"),
    axis.text = element_text(size = 14),
    axis.title.x = element_text(size = 16, margin = margin(t = 30)),
    axis.title.y = element_text(size = 16, margin = margin(r = 30)),
    plot.margin = margin(t = 20, r = 40, b = 40, l = 40),
    legend.position = c(0.85, 0.6),  # Adjust legend to specific coordinates
    legend.justification = c(1, 0),
    legend.text = element_text(size = 12),  # Increase legend text size
    legend.title = element_text(size = 14)  # Increase legend title size
  )

# Display the plot
print(plot)
