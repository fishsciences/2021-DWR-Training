#--------------------------------------------#
# M. Johnston 
# Utility/convenience functions for analysis 
# Wednesday 2020-07-08 14:35:50 ----------------# 


# quickly 'vet' a dataframe by previewing rows at the head, middle, and tail:
#-------------------------------------------------------#
vet <- function(d, n = 4L) {
 if(class(d) != 'data.frame') stop('vet() can only vet dataframes')
 left <- as.integer(nrow(d) / 2 - n / 2)
 torso = d[seq_len(n) + left - 1L,]
rbind(head(d, n), torso, tail(d, n))
}


# typing shortcuts and convenience functions
#--------------------------------------------#
len <- function(x){length(unique(x))}
csn <- function(x){colSums(is.na(x))}
rsn <- function(x){rowSums(is.na(x))}


# plot a fish track:
plot_track = function(dets_df, tagid) {
  d = subset(dets_df, TagID == tagid)
  ggplot(d, aes(x = DateTimePST, y = reorder(GroupedStn, rkms))) +
    geom_jitter(alpha = 0.25, width = 0.2) +
    theme_bw() +
    labs(title = paste(tagid))
}


handle_redeployed_tag <- function(dets_df,
                                  DT_recap = 
                                    
force_tz(
  ymd_hm(
    paste(chn$DateTagged[chn$TagID == 55555], 
          chn$TOR[chn$TagID == 55555], sep = " ")
    ), "Pacific/Pitcairn")
)

{
  
  # redeployed tag
  recap = dets[dets$TagID == 45451, ] 
  recap = recap[order(recap$DateTimePST), ]
  
  # isolate tag's 2nd deployment dets
  recap = recap[recap$DateTimePST >= DT_recap, ] 

# remove detections from re-deployed fish
  d4 = dplyr::anti_join(dets_df, recap)
  recap$TagID = 55555 # assign new tagID
  d5 = dplyr::bind_rows(d4, recap) # back we go
  return(data.frame(d5))
}



# BARD functions
#-------------------------------------------------------#
#-------------------------------------------------------#
join_with_bard <- function(dets_df, bard_dets_df, tags_df = tags) {
  
  bard_dets_df  = bard_dets_df[ ,c( 
                       "TagID",
                       "DateTimePST",
                       "Receiver",
                       "GroupedStn",
                       "rkms") ]
  
dets_df = dets_df[ , c("TagID", "DateTimePST", 
                       "Receiver", "GroupedStn", 
                       "rkms")]

dets_dff = dplyr::bind_rows(dets_df, bard_dets_df)

cs_index = dplyr::select(tags_df, TagID, CodeSpace)

dets_dff = dplyr::left_join(dets_dff, cs_index) # get back codespace
  
return(as.data.frame(dets_dff))

}
