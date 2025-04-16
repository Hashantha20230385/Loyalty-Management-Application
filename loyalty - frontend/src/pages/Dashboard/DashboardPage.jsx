import React, { useState, useEffect, useContext } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Container,
  Grid,
  Paper,
  Typography,
  Box,
  Card,
  CardContent,
  Divider,
  Button,
  IconButton
} from '@mui/material';
import {
  People,
  CardGiftcard,
  Timeline,
  Receipt,
  TrendingUp,
  AddCircleOutline,
  ArrowForward
} from '@mui/icons-material';
import { BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer } from 'recharts';
import { AlertContext } from '../../context/AlertContext';
import customerService from '../../services/customerService';
import loyaltyService from '../../services/loyaltyService';
import transactionService from '../../services/transactionService';
import Loader from '../../components/common/Loader';

const DashboardPage = () => {
  const { setAlert } = useContext(AlertContext);
  const navigate = useNavigate();
  
  const [loading, setLoading] = useState(true);
  const [stats, setStats] = useState({
    totalCustomers: 0,
    totalRewards: 0,
    totalTiers: 0,
    totalTransactions: 0
  });
  
  const [tierDistribution, setTierDistribution] = useState([]);
  
  useEffect(() => {
    const fetchDashboardData = async () => {
      try {
        setLoading(true);
        
        // Fetch customers
        const customers = await customerService.getAllCustomers();
        
        // Fetch rewards
        const rewards = await loyaltyService.getAllRewards();
        
        // Fetch tiers
        const tiers = await loyaltyService.getAllTiers();
        
        // Fetch transactions
        const transactions = await transactionService.getAllTransactions();
        
        // Set stats
        setStats({
          totalCustomers: customers.length,
          totalRewards: rewards.length,
          totalTiers: tiers.length,
          totalTransactions: transactions.length
        });
        
        // Calculate tier distribution
        const tierCounts = {};
        tiers.forEach(tier => {
          tierCounts[tier.tier_name] = 0;
        });
        
        customers.forEach(customer => {
          if (tierCounts[customer.tier] !== undefined) {
            tierCounts[customer.tier]++;
          }
        });
        
        const tierData = Object.keys(tierCounts).map(tierName => ({
          name: tierName,
          customers: tierCounts[tierName]
        }));
        
        setTierDistribution(tierData);
        
      } catch (error) {
        console.error('Error loading dashboard data:', error);
        setAlert({
          show: true,
          severity: 'error',
          message: 'Failed to load dashboard data'
        });
      } finally {
        setLoading(false);
      }
    };
    
    fetchDashboardData();
  }, [setAlert]);
  
  if (loading) {
    return <Loader message="Loading dashboard data..." />;
  }
  
  return (
    <Container maxWidth="lg">
      <Box mb={4}>
        <Typography variant="h4" component="h1" gutterBottom>
          Dashboard
        </Typography>
        <Typography variant="subtitle1" color="textSecondary">
          Overview of your loyalty program
        </Typography>
      </Box>
      
      {/* Stats Cards */}
      <Grid container spacing={3} sx={{ mb: 4 }}>
        <Grid item xs={12} sm={6} md={3}>
          <Card 
            sx={{ 
              height: '100%',
              borderLeft: '4px solid',
              borderColor: 'primary.main'
            }}
          >
            <CardContent>
              <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                <Box>
                  <Typography color="textSecondary" gutterBottom>
                    Total Customers
                  </Typography>
                  <Typography variant="h4" component="div">
                    {stats.totalCustomers}
                  </Typography>
                </Box>
                <People fontSize="large" color="primary" />
              </Box>
              <Button 
                size="small" 
                sx={{ mt: 2 }} 
                endIcon={<ArrowForward />}
                onClick={() => navigate('/customers')}
              >
                View All
              </Button>
            </CardContent>
          </Card>
        </Grid>
        
        <Grid item xs={12} sm={6} md={3}>
          <Card 
            sx={{ 
              height: '100%',
              borderLeft: '4px solid',
              borderColor: 'secondary.main'
            }}
          >
            <CardContent>
              <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                <Box>
                  <Typography color="textSecondary" gutterBottom>
                    Active Rewards
                  </Typography>
                  <Typography variant="h4" component="div">
                    {stats.totalRewards}
                  </Typography>
                </Box>
                <CardGiftcard fontSize="large" color="secondary" />
              </Box>
              <Button 
                size="small" 
                sx={{ mt: 2 }} 
                endIcon={<ArrowForward />}
                onClick={() => navigate('/loyalty/rewards')}
              >
                Manage Rewards
              </Button>
            </CardContent>
          </Card>
        </Grid>
        
        <Grid item xs={12} sm={6} md={3}>
          <Card 
            sx={{ 
              height: '100%',
              borderLeft: '4px solid',
              borderColor: 'error.main'
            }}
          >
            <CardContent>
              <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                <Box>
                  <Typography color="textSecondary" gutterBottom>
                    Loyalty Tiers
                  </Typography>
                  <Typography variant="h4" component="div">
                    {stats.totalTiers}
                  </Typography>
                </Box>
                <Timeline fontSize="large" color="error" />
              </Box>
              <Button 
                size="small" 
                sx={{ mt: 2 }} 
                endIcon={<ArrowForward />}
                onClick={() => navigate('/loyalty/tiers')}
              >
                View Tiers
              </Button>
            </CardContent>
          </Card>
        </Grid>
        
        <Grid item xs={12} sm={6} md={3}>
          <Card 
            sx={{ 
              height: '100%',
              borderLeft: '4px solid',
              borderColor: 'info.main'
            }}
          >
            <CardContent>
              <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                <Box>
                  <Typography color="textSecondary" gutterBottom>
                    Total Transactions
                  </Typography>
                  <Typography variant="h4" component="div">
                    {stats.totalTransactions}
                  </Typography>
                </Box>
                <Receipt fontSize="large" color="info" />
              </Box>
              <Button 
                size="small" 
                sx={{ mt: 2 }} 
                endIcon={<ArrowForward />}
                onClick={() => navigate('/transactions')}
              >
                View Transactions
              </Button>
            </CardContent>
          </Card>
        </Grid>
      </Grid>
      
      {/* Customer Tier Distribution */}
      <Grid container spacing={3}>
        <Grid item xs={12} md={8}>
          <Paper sx={{ p: 3, height: '100%' }}>
            <Typography variant="h6" gutterBottom>
              Customer Tier Distribution
            </Typography>
            <Divider sx={{ mb: 3 }} />
            
            {tierDistribution.length > 0 ? (
              <ResponsiveContainer width="100%" height={300}>
                <BarChart
                  data={tierDistribution}
                  margin={{
                    top: 20,
                    right: 30,
                    left: 20,
                    bottom: 5,
                  }}
                >
                  <XAxis dataKey="name" />
                  <YAxis allowDecimals={false} />
                  <Tooltip />
                  <Bar dataKey="customers" fill="#8884d8" />
                </BarChart>
              </ResponsiveContainer>
            ) : (
              <Box sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: 300 }}>
                <Typography variant="body1" color="textSecondary">
                  No tier data available
                </Typography>
              </Box>
            )}
          </Paper>
        </Grid>
        
        <Grid item xs={12} md={4}>
          <Paper sx={{ p: 3, height: '100%' }}>
            <Typography variant="h6" gutterBottom>
              Quick Actions
            </Typography>
            <Divider sx={{ mb: 3 }} />
            
            <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2 }}>
              <Button
                variant="outlined"
                color="primary"
                startIcon={<AddCircleOutline />}
                sx={{ justifyContent: 'flex-start' }}
                onClick={() => navigate('/customers/add')}
              >
                Add New Customer
              </Button>
              
              <Button
                variant="outlined"
                color="secondary"
                startIcon={<TrendingUp />}
                sx={{ justifyContent: 'flex-start' }}
                onClick={() => navigate('/segments/add')}
              >
                Create Customer Segment
              </Button>
              
              <Button
                variant="outlined"
                color="info"
                startIcon={<CardGiftcard />}
                sx={{ justifyContent: 'flex-start' }}
                onClick={() => navigate('/loyalty/rewards/add')}
              >
                Add New Reward
              </Button>
            </Box>
          </Paper>
        </Grid>
      </Grid>
    </Container>
  );
};

export default DashboardPage;