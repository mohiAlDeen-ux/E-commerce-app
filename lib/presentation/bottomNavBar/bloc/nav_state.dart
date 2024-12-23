enum NavState{
    HomeScreen,
    DiscoverScreen,
    BookmarkScreen,
    // EmptyCartScreen(), // if Cart is empty
    CardScreen,
    ProfileScreen,
}

  int getNavIndex(NavState navState){
    return NavState.values.indexOf(navState);
  }

  NavState getNavPyIndex(int index){
    return NavState.values[index];
  }